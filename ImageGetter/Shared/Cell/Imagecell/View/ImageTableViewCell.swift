//
//  ImageTableViewCell.swift
//  ImageGetter
//
//  Created by Victor Vidal on 21/02/22.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell1: UIImageView!
    @IBOutlet weak var imageCell2: UIImageView!
    @IBOutlet weak var imageCell3: UIImageView!
    @IBOutlet weak var imageCell4: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupValues(viewModel: NoInternetCellViewModel) {
        self.imageCell1.image = viewModel.model?.Image1
        self.imageCell2.image = viewModel.model?.Image2
        self.imageCell3.image = viewModel.model?.Image3
        self.imageCell4.image = viewModel.model?.Image4
    }
    
}
