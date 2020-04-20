-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetAutoDownloadSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.NetworkType as NetworkType
import {-# SOURCE #-} qualified API.AutoDownloadSettings as AutoDownloadSettings

--main = putStrLn "ok"

data SetAutoDownloadSettings = 
 SetAutoDownloadSettings { _type :: NetworkType.NetworkType, settings :: AutoDownloadSettings.AutoDownloadSettings }  -- deriving (Show)

instance T.ToJSON SetAutoDownloadSettings where
 toJSON (SetAutoDownloadSettings { _type = _type, settings = settings }) =
  A.object [ "@type" A..= T.String "setAutoDownloadSettings", "type" A..= _type, "settings" A..= settings ]
-- setAutoDownloadSettings SetAutoDownloadSettings  { _type :: NetworkType.NetworkType, settings :: AutoDownloadSettings.AutoDownloadSettings } 

