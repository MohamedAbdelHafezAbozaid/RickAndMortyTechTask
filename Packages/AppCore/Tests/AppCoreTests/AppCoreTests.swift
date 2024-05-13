import XCTest
import Networking
import Commons
import protocol AppCore.RemoteCharactersLoaderProtocols
import class AppCore.RemoteCharactersLoader


final class AppCoreTests: XCTestCase {
    
    func test_UseCase_fetchingDataCountSuccessFully() {
        runAsyncTest { [weak self] in
            // Arrange
            guard let strongSelf = self else { return }
            let sut = strongSelf.makeSUT()
            // Act
            let data = try await sut.loadCharacters(page: 1, status: nil)
            // Assert
            XCTAssertEqual(data.characters.count, 20)
        }
    }
    
    func test_UseCase_fetchingPainatedDataCountSuccessFully() {
        runAsyncTest { [weak self] in
            // Arrange
            var fetchedCharacters = [MainCharacter]()
            guard let strongSelf = self else { return }
            let sut = strongSelf.makeSUT()
            // Act
            let firstPageData = try await sut.loadCharacters(page: 1, status: nil)
            fetchedCharacters.append(contentsOf: firstPageData.characters)
            let secondPageData = try await sut.loadCharacters(page: 2, status: nil)
            fetchedCharacters.append(contentsOf: secondPageData.characters)
            // Assert
            XCTAssertEqual(fetchedCharacters.count, 40)
        }
    }
    
    func test_UseCase_mapFetchDataSuccessFully() {
        runAsyncTest { [weak self] in
            // Arrange
            guard let strongSelf = self else { return }
            let sut = strongSelf.makeSUT()
            // Act
            let data = try await sut.loadCharacters(page: 1, status: nil)
            let mockedResponse = strongSelf.fetchMockedData()
            // Assert
            XCTAssertEqual(data.characters.count, mockedResponse.count)
            XCTAssertEqual(data.characters.first!.id, mockedResponse.first!.id)
            XCTAssertEqual(data.characters.last!.id, mockedResponse.last!.id)
        }
    }
    
    func test_UseCase_FetchFilteredUnKnowenDataSuccessFully() {
        runAsyncTest { [weak self] in
            // Arrange
            guard let strongSelf = self else { return }
            let sut = strongSelf.makeSUT()
            // Act
            let data = try await sut.loadCharacters(page: 1, status: "unknown")
            let mockedResponse = strongSelf.fetchMockedData()
            // Assert
            XCTAssertEqual(data.characters.first!.status.rawValue, "unknown")
            XCTAssertEqual(data.characters.last!.status.rawValue, "unknown")
        }
    }
    
    func test_UseCase_FetchFilteredDeadDataSuccessFully() {
        runAsyncTest { [weak self] in
            // Arrange
            guard let strongSelf = self else { return }
            let sut = strongSelf.makeSUT()
            // Act
            let data = try await sut.loadCharacters(page: 1, status: "Dead")
            let mockedResponse = strongSelf.fetchMockedData()
            // Assert
            XCTAssertEqual(data.characters.first!.status.rawValue, "Dead")
            XCTAssertEqual(data.characters.last!.status.rawValue, "Dead")
        }
    }
    
    //MARK: - Helpers
    private func makeSUT() -> RemoteCharactersLoaderProtocols {
        return RemoteCharactersLoader()
    }
    
    private func fetchMockedData() -> [MainCharacter] {
        guard let mockedData = Bundle.module.url(forResource: "Mock", withExtension: "json") else { return [] }
        do {
            let data = try Data(contentsOf: mockedData)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(BaseResponse.self, from: data)
            guard let results = jsonData.results else {return []}
            let info = PresentableResponse(
                paginationEnds: false,
                characters: results.toModels()
            )
            return info.characters
        } catch {
            return []
        }
    }
}

