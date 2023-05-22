/*
 * Copyright 2020 Google Inc. All rights reserved.
 *
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
 * file except in compliance with the License. You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under
 * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
 * ANY KIND, either express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 41.877175, longitude: 1.5717355, zoom: 20.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)

        let path = GMSMutablePath()
        path.add(CLLocationCoordinate2D(latitude: 41.877, longitude: 1.5718))
        path.add(CLLocationCoordinate2D(latitude: 41.877162, longitude: 1.571836))
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 30 
        polyline.spans = GMSStyleSpans(
          polyline.path!,
          [
              GMSStrokeStyle.solidColor(.black),
              GMSStrokeStyle.solidColor(.white)
          ],
          [0.1, 0.5],
          GMSLengthKind.rhumb
        )
        polyline.map = mapView
  }
}

