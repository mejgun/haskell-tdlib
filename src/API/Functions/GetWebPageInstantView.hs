-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetWebPageInstantView where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetWebPageInstantView = 
 GetWebPageInstantView { force_full :: Bool, url :: String }  deriving (Show)

instance T.ToJSON GetWebPageInstantView where
 toJSON (GetWebPageInstantView { force_full = force_full, url = url }) =
  A.object [ "@type" A..= T.String "getWebPageInstantView", "force_full" A..= force_full, "url" A..= url ]

instance T.FromJSON GetWebPageInstantView where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getWebPageInstantView" -> parseGetWebPageInstantView v
   _ -> mempty
  where
   parseGetWebPageInstantView :: A.Value -> T.Parser GetWebPageInstantView
   parseGetWebPageInstantView = A.withObject "GetWebPageInstantView" $ \o -> do
    force_full <- o A..: "force_full"
    url <- o A..: "url"
    return $ GetWebPageInstantView { force_full = force_full, url = url }