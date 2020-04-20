-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BasicGroupFullInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatMember as ChatMember

--main = putStrLn "ok"

data BasicGroupFullInfo = 
 BasicGroupFullInfo { invite_link :: String, members :: [ChatMember.ChatMember], creator_user_id :: Int, description :: String }  -- deriving (Show)

instance T.ToJSON BasicGroupFullInfo where
 toJSON (BasicGroupFullInfo { invite_link = invite_link, members = members, creator_user_id = creator_user_id, description = description }) =
  A.object [ "@type" A..= T.String "basicGroupFullInfo", "invite_link" A..= invite_link, "members" A..= members, "creator_user_id" A..= creator_user_id, "description" A..= description ]
-- basicGroupFullInfo BasicGroupFullInfo  { invite_link :: String, members :: [ChatMember.ChatMember], creator_user_id :: Int, description :: String } 

