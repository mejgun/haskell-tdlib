-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatsNearby where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatNearby as ChatNearby

-- |
-- 
-- Represents a list of chats located nearby 
-- 
-- __users_nearby__ List of users nearby
-- 
-- __supergroups_nearby__ List of location-based supergroups nearby
data ChatsNearby = 

 ChatsNearby { supergroups_nearby :: Maybe [ChatNearby.ChatNearby], users_nearby :: Maybe [ChatNearby.ChatNearby] }  deriving (Eq)

instance Show ChatsNearby where
 show ChatsNearby { supergroups_nearby=supergroups_nearby, users_nearby=users_nearby } =
  "ChatsNearby" ++ cc [p "supergroups_nearby" supergroups_nearby, p "users_nearby" users_nearby ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ChatsNearby where
 toJSON ChatsNearby { supergroups_nearby = supergroups_nearby, users_nearby = users_nearby } =
  A.object [ "@type" A..= T.String "chatsNearby", "supergroups_nearby" A..= supergroups_nearby, "users_nearby" A..= users_nearby ]

instance T.FromJSON ChatsNearby where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatsNearby" -> parseChatsNearby v
   _ -> mempty
  where
   parseChatsNearby :: A.Value -> T.Parser ChatsNearby
   parseChatsNearby = A.withObject "ChatsNearby" $ \o -> do
    supergroups_nearby <- o A..:? "supergroups_nearby"
    users_nearby <- o A..:? "users_nearby"
    return $ ChatsNearby { supergroups_nearby = supergroups_nearby, users_nearby = users_nearby }
 parseJSON _ = mempty
