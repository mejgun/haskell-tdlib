-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRecentlyVisitedTMeUrls where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetRecentlyVisitedTMeUrls = 
 GetRecentlyVisitedTMeUrls { referrer :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON GetRecentlyVisitedTMeUrls where
 toJSON (GetRecentlyVisitedTMeUrls { referrer = referrer }) =
  A.object [ "@type" A..= T.String "getRecentlyVisitedTMeUrls", "referrer" A..= referrer ]

instance T.FromJSON GetRecentlyVisitedTMeUrls where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getRecentlyVisitedTMeUrls" -> parseGetRecentlyVisitedTMeUrls v
   _ -> mempty
  where
   parseGetRecentlyVisitedTMeUrls :: A.Value -> T.Parser GetRecentlyVisitedTMeUrls
   parseGetRecentlyVisitedTMeUrls = A.withObject "GetRecentlyVisitedTMeUrls" $ \o -> do
    referrer <- o A..:? "referrer"
    return $ GetRecentlyVisitedTMeUrls { referrer = referrer }