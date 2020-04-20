-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatMembers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatMember as ChatMember

--main = putStrLn "ok"

data ChatMembers = 
 ChatMembers { members :: [ChatMember.ChatMember], total_count :: Int }  -- deriving (Show)

instance T.ToJSON ChatMembers where
 toJSON (ChatMembers { members = members, total_count = total_count }) =
  A.object [ "@type" A..= T.String "chatMembers", "members" A..= members, "total_count" A..= total_count ]
-- chatMembers ChatMembers  { members :: [ChatMember.ChatMember], total_count :: Int } 

