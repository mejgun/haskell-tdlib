-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatJoinRequest where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Describes a user that sent a join request and waits for administrator approval 
-- 
-- __user_id__ User identifier
-- 
-- __date__ Point in time (Unix timestamp) when the user sent the join request
-- 
-- __bio__ A short bio of the user
data ChatJoinRequest = 

 ChatJoinRequest { bio :: Maybe String, date :: Maybe Int, user_id :: Maybe Int }  deriving (Eq)

instance Show ChatJoinRequest where
 show ChatJoinRequest { bio=bio, date=date, user_id=user_id } =
  "ChatJoinRequest" ++ cc [p "bio" bio, p "date" date, p "user_id" user_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ChatJoinRequest where
 toJSON ChatJoinRequest { bio = bio, date = date, user_id = user_id } =
  A.object [ "@type" A..= T.String "chatJoinRequest", "bio" A..= bio, "date" A..= date, "user_id" A..= user_id ]

instance T.FromJSON ChatJoinRequest where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatJoinRequest" -> parseChatJoinRequest v
   _ -> mempty
  where
   parseChatJoinRequest :: A.Value -> T.Parser ChatJoinRequest
   parseChatJoinRequest = A.withObject "ChatJoinRequest" $ \o -> do
    bio <- o A..:? "bio"
    date <- mconcat [ o A..:? "date", readMaybe <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatJoinRequest { bio = bio, date = date, user_id = user_id }
 parseJSON _ = mempty
