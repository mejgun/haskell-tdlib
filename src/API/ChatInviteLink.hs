-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ChatInviteLink = 
 ChatInviteLink { invite_link :: String }  -- deriving (Show)

instance T.ToJSON ChatInviteLink where
 toJSON (ChatInviteLink { invite_link = invite_link }) =
  A.object [ "@type" A..= T.String "chatInviteLink", "invite_link" A..= invite_link ]
-- chatInviteLink ChatInviteLink  { invite_link :: String } 

