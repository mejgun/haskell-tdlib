-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetApplicationDownloadLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns the link for downloading official Telegram application to be used when the current user invites friends to Telegram
data GetApplicationDownloadLink = 

 GetApplicationDownloadLink deriving (Eq)

instance Show GetApplicationDownloadLink where
 show GetApplicationDownloadLink {  } =
  "GetApplicationDownloadLink" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetApplicationDownloadLink where
 toJSON GetApplicationDownloadLink {  } =
  A.object [ "@type" A..= T.String "getApplicationDownloadLink" ]

instance T.FromJSON GetApplicationDownloadLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getApplicationDownloadLink" -> parseGetApplicationDownloadLink v
   _ -> mempty
  where
   parseGetApplicationDownloadLink :: A.Value -> T.Parser GetApplicationDownloadLink
   parseGetApplicationDownloadLink = A.withObject "GetApplicationDownloadLink" $ \o -> do
    return $ GetApplicationDownloadLink {  }
 parseJSON _ = mempty
