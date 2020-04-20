-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatsNearby where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatNearby as ChatNearby

--main = putStrLn "ok"

data ChatsNearby = 
 ChatsNearby { supergroups_nearby :: [ChatNearby.ChatNearby], users_nearby :: [ChatNearby.ChatNearby] }  -- deriving (Show)

instance T.ToJSON ChatsNearby where
 toJSON (ChatsNearby { supergroups_nearby = supergroups_nearby, users_nearby = users_nearby }) =
  A.object [ "@type" A..= T.String "chatsNearby", "supergroups_nearby" A..= supergroups_nearby, "users_nearby" A..= users_nearby ]
-- chatsNearby ChatsNearby  { supergroups_nearby :: [ChatNearby.ChatNearby], users_nearby :: [ChatNearby.ChatNearby] } 

