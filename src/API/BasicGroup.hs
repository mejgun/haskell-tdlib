-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BasicGroup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatMemberStatus as ChatMemberStatus

--main = putStrLn "ok"

data BasicGroup = 
 BasicGroup { upgraded_to_supergroup_id :: Int, is_active :: Bool, status :: ChatMemberStatus.ChatMemberStatus, member_count :: Int, _id :: Int }  -- deriving (Show)

instance T.ToJSON BasicGroup where
 toJSON (BasicGroup { upgraded_to_supergroup_id = upgraded_to_supergroup_id, is_active = is_active, status = status, member_count = member_count, _id = _id }) =
  A.object [ "@type" A..= T.String "basicGroup", "upgraded_to_supergroup_id" A..= upgraded_to_supergroup_id, "is_active" A..= is_active, "status" A..= status, "member_count" A..= member_count, "id" A..= _id ]
-- basicGroup BasicGroup  { upgraded_to_supergroup_id :: Int, is_active :: Bool, status :: ChatMemberStatus.ChatMemberStatus, member_count :: Int, _id :: Int } 

