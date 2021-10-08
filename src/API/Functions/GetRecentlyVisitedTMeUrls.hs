-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRecentlyVisitedTMeUrls where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns t.me URLs recently visited by a newly registered user 
-- 
-- __referrer__ Google Play referrer to identify the user
data GetRecentlyVisitedTMeUrls = 

 GetRecentlyVisitedTMeUrls { referrer :: Maybe String }  deriving (Eq)

instance Show GetRecentlyVisitedTMeUrls where
 show GetRecentlyVisitedTMeUrls { referrer=referrer } =
  "GetRecentlyVisitedTMeUrls" ++ cc [p "referrer" referrer ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetRecentlyVisitedTMeUrls where
 toJSON GetRecentlyVisitedTMeUrls { referrer = referrer } =
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
 parseJSON _ = mempty
