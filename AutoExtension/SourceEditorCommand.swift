//
//  SourceEditorCommand.swift
//  AutoExtension
//
//  Created by Katsuhiko Terada on 2021/09/21.
//

import Foundation
import XcodeKit
import SwiftSyntax

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        
        let buffer = invocation.buffer

        guard let lines = buffer.lines as? [String] else {
            completionHandler(nil)
            return
        }

        guard let selections = buffer.selections as? [XCSourceTextRange] else {
            completionHandler(nil)
            return
        }

        do {
            
            for selection in selections {
                let selectedLines = lines[selection.start.line..<selection.end.line]
                let sourceFile = try SyntaxParser.parse(source: selectedLines.joined())

                let visitor = MySyntaxVisitor()
                visitor.walk(sourceFile)
            }

        } catch let e {
            print(e)
        }

        completionHandler(nil)
    }
    
}

public struct GeneratedProtocolDeclSyntax {
    public let protocolDeclSyntax: ProtocolDeclSyntax
    public let prefixComment: String
}

public class MySyntaxVisitor: SyntaxVisitor {
    public var protocolDeclSyntaxList = [GeneratedProtocolDeclSyntax]()

    public override func visit(_ node: ClassDeclSyntax) -> SyntaxVisitorContinueKind {
        let functions = node.members.members.compactMap { (member) -> FunctionDeclSyntax? in
            guard let functionDecl = member.decl.as(FunctionDeclSyntax.self) else {
                return nil
            }
            
            print(functionDecl)
            
            return functionDecl
        }
        
        let variables = node.members.members.compactMap { (member) -> VariableDeclSyntax? in
            guard let variableDecl = member.decl.as(VariableDeclSyntax.self) else {
                return nil
            }

            print(variableDecl)

            return variableDecl
        }
        
        let initilizers = node.members.members.compactMap { (member) -> InitializerDeclSyntax? in
            guard let initializerDecl = member.decl.as(InitializerDeclSyntax.self) else {
                return nil
            }
            
            print(initializerDecl)
            
            return initializerDecl
        }
        
        return .skipChildren
    }
    
    public override func visit(_ node: StructDeclSyntax) -> SyntaxVisitorContinueKind {
        let functions = node.members.members.compactMap { (member) -> FunctionDeclSyntax? in
            guard let functionDecl = member.decl.as(FunctionDeclSyntax.self) else {
                return nil
            }
            
            print(functionDecl)
            
            return functionDecl
        }
        
        let variables = node.members.members.compactMap { (member) -> VariableDeclSyntax? in
            guard let variableDecl = member.decl.as(VariableDeclSyntax.self) else {
                return nil
            }

            print(variableDecl)

            return variableDecl
        }
        
        let initilizers = node.members.members.compactMap { (member) -> InitializerDeclSyntax? in
            guard let initializerDecl = member.decl.as(InitializerDeclSyntax.self) else {
                return nil
            }
            
            print(initializerDecl)
            
            return initializerDecl
        }
        
        return .skipChildren
    }
    
    
    public override func visit(_ node: EnumDeclSyntax) -> SyntaxVisitorContinueKind {
        let functions = node.members.members.compactMap { (member) -> FunctionDeclSyntax? in
            guard let functionDecl = member.decl.as(FunctionDeclSyntax.self) else {
                return nil
            }
            
            print(functionDecl)
            
            return functionDecl
        }
        
        let variables = node.members.members.compactMap { (member) -> VariableDeclSyntax? in
            guard let variableDecl = member.decl.as(VariableDeclSyntax.self) else {
                return nil
            }

            print(variableDecl)

            return variableDecl
        }
        
        let initilizers = node.members.members.compactMap { (member) -> InitializerDeclSyntax? in
            guard let initializerDecl = member.decl.as(InitializerDeclSyntax.self) else {
                return nil
            }
            
            print(initializerDecl)
            
            return initializerDecl
        }
        
        return .skipChildren
    }
}
