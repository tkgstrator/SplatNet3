//
//  SkinInfoKey.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/09/22
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//


import Foundation

public enum SkinInfoKey: String, CaseIterable, Identifiable, Codable {
	public var id: String { rawValue }
	case COP001 = "89df74f2b5fbc49f76fb31f730fed012bb77f903746e81df108958010c95ef53"
	case COP002 = "87f1b945e1dc58370d4843365714a296ab7d012d2ee6b31eedd3d7fdd840c9a9"
	case COP003 = "7c0c19d3267f4ff1db3f579f48058c750357fa289b796f6772003500d20225f3"
	case COP004 = "61acba988871d0e9ce259138cde62f9b8f83bb8014ef14c9abb3acf0aa38c51f"
	case COP005 = "6f122e0df7ea751edae1a786e0b279abde7b31a0fce3c2962b9e87bace175f6f"
	case COP006 = "f82fae832ee52b0843db0d99151c8d7c9afa67b50b77b5588bc46d2e4554deb8"
	case COP007 = "58af0bebd80a91fea27b302938365f215d7cd2d735635d3e26f7e4140145643d"
}