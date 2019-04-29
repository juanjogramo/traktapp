//
//  MovieTableViewCell.swift
//  TrackApp
//
//  Created by Juan José Granados Moreno on 4/28/19.
//  Copyright © 2019 juanjogramo. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    
}
