-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetWebPageInstantView where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns an instant view version of a web page if available. Returns a 404 error if the web page has no instant view page 
-- 
-- __url__ The web page URL
-- 
-- __force_full__ If true, the full instant view for the web page will be returned
data GetWebPageInstantView = 

 GetWebPageInstantView { force_full :: Maybe Bool, url :: Maybe String }  deriving (Show, Eq)

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
    force_full <- o A..:? "force_full"
    url <- o A..:? "url"
    return $ GetWebPageInstantView { force_full = force_full, url = url }