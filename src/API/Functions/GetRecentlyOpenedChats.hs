-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRecentlyOpenedChats where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns recently opened chats, this is an offline request. Returns chats in the order of last opening 
-- 
-- __limit__ The maximum number of chats to be returned
data GetRecentlyOpenedChats = 

 GetRecentlyOpenedChats { limit :: Maybe Int }  deriving (Eq)

instance Show GetRecentlyOpenedChats where
 show GetRecentlyOpenedChats { limit=limit } =
  "GetRecentlyOpenedChats" ++ cc [p "limit" limit ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetRecentlyOpenedChats where
 toJSON GetRecentlyOpenedChats { limit = limit } =
  A.object [ "@type" A..= T.String "getRecentlyOpenedChats", "limit" A..= limit ]

instance T.FromJSON GetRecentlyOpenedChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getRecentlyOpenedChats" -> parseGetRecentlyOpenedChats v
   _ -> mempty
  where
   parseGetRecentlyOpenedChats :: A.Value -> T.Parser GetRecentlyOpenedChats
   parseGetRecentlyOpenedChats = A.withObject "GetRecentlyOpenedChats" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetRecentlyOpenedChats { limit = limit }
 parseJSON _ = mempty
