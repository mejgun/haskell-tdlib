-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetAutoDownloadSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.NetworkType as NetworkType
import {-# SOURCE #-} qualified API.AutoDownloadSettings as AutoDownloadSettings

--main = putStrLn "ok"

data SetAutoDownloadSettings = 
 SetAutoDownloadSettings { _type :: NetworkType.NetworkType, settings :: AutoDownloadSettings.AutoDownloadSettings }  deriving (Show)

instance T.ToJSON SetAutoDownloadSettings where
 toJSON (SetAutoDownloadSettings { _type = _type, settings = settings }) =
  A.object [ "@type" A..= T.String "setAutoDownloadSettings", "type" A..= _type, "settings" A..= settings ]



instance T.FromJSON SetAutoDownloadSettings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setAutoDownloadSettings" -> parseSetAutoDownloadSettings v

   _ -> mempty ""
  where
   parseSetAutoDownloadSettings :: A.Value -> T.Parser SetAutoDownloadSettings
   parseSetAutoDownloadSettings = A.withObject "SetAutoDownloadSettings" $ \o -> do
    _type <- o A..: "type"
    settings <- o A..: "settings"
    return $ SetAutoDownloadSettings { _type = _type, settings = settings }