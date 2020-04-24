-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TMeUrls where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TMeUrl as TMeUrl

data TMeUrls = 
 TMeUrls { urls :: Maybe [TMeUrl.TMeUrl] }  deriving (Show, Eq)

instance T.ToJSON TMeUrls where
 toJSON (TMeUrls { urls = urls }) =
  A.object [ "@type" A..= T.String "tMeUrls", "urls" A..= urls ]

instance T.FromJSON TMeUrls where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "tMeUrls" -> parseTMeUrls v
   _ -> mempty
  where
   parseTMeUrls :: A.Value -> T.Parser TMeUrls
   parseTMeUrls = A.withObject "TMeUrls" $ \o -> do
    urls <- optional $ o A..: "urls"
    return $ TMeUrls { urls = urls }