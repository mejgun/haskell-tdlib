-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TMeUrlType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatInviteLinkInfo as ChatInviteLinkInfo

data TMeUrlType = 
 TMeUrlTypeUser { user_id :: Maybe Int }  
 | TMeUrlTypeSupergroup { supergroup_id :: Maybe Int }  
 | TMeUrlTypeChatInvite { info :: Maybe ChatInviteLinkInfo.ChatInviteLinkInfo }  
 | TMeUrlTypeStickerSet { sticker_set_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON TMeUrlType where
 toJSON (TMeUrlTypeUser { user_id = user_id }) =
  A.object [ "@type" A..= T.String "tMeUrlTypeUser", "user_id" A..= user_id ]

 toJSON (TMeUrlTypeSupergroup { supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "tMeUrlTypeSupergroup", "supergroup_id" A..= supergroup_id ]

 toJSON (TMeUrlTypeChatInvite { info = info }) =
  A.object [ "@type" A..= T.String "tMeUrlTypeChatInvite", "info" A..= info ]

 toJSON (TMeUrlTypeStickerSet { sticker_set_id = sticker_set_id }) =
  A.object [ "@type" A..= T.String "tMeUrlTypeStickerSet", "sticker_set_id" A..= sticker_set_id ]

instance T.FromJSON TMeUrlType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "tMeUrlTypeUser" -> parseTMeUrlTypeUser v
   "tMeUrlTypeSupergroup" -> parseTMeUrlTypeSupergroup v
   "tMeUrlTypeChatInvite" -> parseTMeUrlTypeChatInvite v
   "tMeUrlTypeStickerSet" -> parseTMeUrlTypeStickerSet v
   _ -> mempty
  where
   parseTMeUrlTypeUser :: A.Value -> T.Parser TMeUrlType
   parseTMeUrlTypeUser = A.withObject "TMeUrlTypeUser" $ \o -> do
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ TMeUrlTypeUser { user_id = user_id }

   parseTMeUrlTypeSupergroup :: A.Value -> T.Parser TMeUrlType
   parseTMeUrlTypeSupergroup = A.withObject "TMeUrlTypeSupergroup" $ \o -> do
    supergroup_id <- mconcat [ o A..:? "supergroup_id", readMaybe <$> (o A..: "supergroup_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ TMeUrlTypeSupergroup { supergroup_id = supergroup_id }

   parseTMeUrlTypeChatInvite :: A.Value -> T.Parser TMeUrlType
   parseTMeUrlTypeChatInvite = A.withObject "TMeUrlTypeChatInvite" $ \o -> do
    info <- o A..:? "info"
    return $ TMeUrlTypeChatInvite { info = info }

   parseTMeUrlTypeStickerSet :: A.Value -> T.Parser TMeUrlType
   parseTMeUrlTypeStickerSet = A.withObject "TMeUrlTypeStickerSet" $ \o -> do
    sticker_set_id <- mconcat [ o A..:? "sticker_set_id", readMaybe <$> (o A..: "sticker_set_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ TMeUrlTypeStickerSet { sticker_set_id = sticker_set_id }