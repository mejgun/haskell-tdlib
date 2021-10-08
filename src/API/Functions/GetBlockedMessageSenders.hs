-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetBlockedMessageSenders where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns users and chats that were blocked by the current user 
-- 
-- __offset__ Number of users and chats to skip in the result; must be non-negative
-- 
-- __limit__ The maximum number of users and chats to return; up to 100
data GetBlockedMessageSenders = 

 GetBlockedMessageSenders { limit :: Maybe Int, offset :: Maybe Int }  deriving (Eq)

instance Show GetBlockedMessageSenders where
 show GetBlockedMessageSenders { limit=limit, offset=offset } =
  "GetBlockedMessageSenders" ++ cc [p "limit" limit, p "offset" offset ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetBlockedMessageSenders where
 toJSON GetBlockedMessageSenders { limit = limit, offset = offset } =
  A.object [ "@type" A..= T.String "getBlockedMessageSenders", "limit" A..= limit, "offset" A..= offset ]

instance T.FromJSON GetBlockedMessageSenders where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getBlockedMessageSenders" -> parseGetBlockedMessageSenders v
   _ -> mempty
  where
   parseGetBlockedMessageSenders :: A.Value -> T.Parser GetBlockedMessageSenders
   parseGetBlockedMessageSenders = A.withObject "GetBlockedMessageSenders" $ \o -> do
    limit <- mconcat [ o A..:? "limit", readMaybe <$> (o A..: "limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset <- mconcat [ o A..:? "offset", readMaybe <$> (o A..: "offset" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetBlockedMessageSenders { limit = limit, offset = offset }
 parseJSON _ = mempty
