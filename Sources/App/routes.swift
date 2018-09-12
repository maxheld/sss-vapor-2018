import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req -> String in
        let name = "world" //try req.parameters.next()
        return "Hello, \(name)!"
    }

    struct JSONExample: Content {
        let name: String
        let age: Int
        let birthday: Date
    }

    router.get("json") { req -> JSONExample in
        return JSONExample (
            name: "Hello",
            age: 20,
            birthday: Date()
        )
    }


    // Example of configuring a controller
    let todoController = TodoController()
    let todos = router.grouped("todos")

    todos.get(use: todoController.index)
    todos.get(Todo.parameter, use: todoController.view)
    todos.post(use: todoController.create)
    todos.patch(Todo.parameter, use: todoController.update)
    todos.delete(Todo.parameter, use: todoController.delete)
    todos.delete(use: todoController.clear)
}
