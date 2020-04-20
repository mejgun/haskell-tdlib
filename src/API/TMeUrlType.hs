-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TMeUrlType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatInviteLinkInfo as ChatInviteLinkInfo

--main = putStrLn "ok"

data TMeUrlType = 
 TMeUrlTypeUser { user_id :: Int }  
 | TMeUrlTypeSupergroup { supergroup_id :: Int }  
 | TMeUrlTypeChatInvite { info :: ChatInviteLinkInfo.ChatInviteLinkInfo }  
 | TMeUrlTypeStickerSet { sticker_set_id :: Int }  -- deriving (Show)

instance T.ToJSON TMeUrlType where
 toJSON (TMeUrlTypeUser { user_id = user_id }) =
  A.object [ "@type" A..= T.String "tMeUrlTypeUser", "user_id" A..= user_id ]

 toJSON (TMeUrlTypeSupergroup { supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "tMeUrlTypeSupergroup", "supergroup_id" A..= supergroup_id ]

 toJSON (TMeUrlTypeChatInvite { info = info }) =
  A.object [ "@type" A..= T.String "tMeUrlTypeChatInvite", "info" A..= info ]

 toJSON (TMeUrlTypeStickerSet { sticker_set_id = sticker_set_id }) =
  A.object [ "@type" A..= T.String "tMeUrlTypeStickerSet", "sticker_set_id" A..= sticker_set_id ]
-- tMeUrlTypeUser TMeUrlType  { user_id :: Int } 

-- tMeUrlTypeSupergroup TMeUrlType  { supergroup_id :: Int } 

-- tMeUrlTypeChatInvite TMeUrlType  { info :: ChatInviteLinkInfo.ChatInviteLinkInfo } 

-- tMeUrlTypeStickerSet TMeUrlType  { sticker_set_id :: Int } 

