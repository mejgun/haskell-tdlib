{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.TMeUrlType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatInviteLinkInfo as ChatInviteLinkInfo
import qualified Utils as U

-- | Describes the type of a URL linking to an internal Telegram entity
data TMeUrlType
  = -- | A URL linking to a user @user_id Identifier of the user
    TMeUrlTypeUser
      { -- |
        user_id :: Maybe Int
      }
  | -- | A URL linking to a public supergroup or channel @supergroup_id Identifier of the supergroup or channel
    TMeUrlTypeSupergroup
      { -- |
        supergroup_id :: Maybe Int
      }
  | -- | A chat invite link @info Information about the chat invite link
    TMeUrlTypeChatInvite
      { -- |
        info :: Maybe ChatInviteLinkInfo.ChatInviteLinkInfo
      }
  | -- | A URL linking to a sticker set @sticker_set_id Identifier of the sticker set
    TMeUrlTypeStickerSet
      { -- |
        sticker_set_id :: Maybe Int
      }
  deriving (Eq)

instance Show TMeUrlType where
  show
    TMeUrlTypeUser
      { user_id = user_id_
      } =
      "TMeUrlTypeUser"
        ++ U.cc
          [ U.p "user_id" user_id_
          ]
  show
    TMeUrlTypeSupergroup
      { supergroup_id = supergroup_id_
      } =
      "TMeUrlTypeSupergroup"
        ++ U.cc
          [ U.p "supergroup_id" supergroup_id_
          ]
  show
    TMeUrlTypeChatInvite
      { info = info_
      } =
      "TMeUrlTypeChatInvite"
        ++ U.cc
          [ U.p "info" info_
          ]
  show
    TMeUrlTypeStickerSet
      { sticker_set_id = sticker_set_id_
      } =
      "TMeUrlTypeStickerSet"
        ++ U.cc
          [ U.p "sticker_set_id" sticker_set_id_
          ]

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
        user_id_ <- o A..:? "user_id"
        return $ TMeUrlTypeUser {user_id = user_id_}

      parseTMeUrlTypeSupergroup :: A.Value -> T.Parser TMeUrlType
      parseTMeUrlTypeSupergroup = A.withObject "TMeUrlTypeSupergroup" $ \o -> do
        supergroup_id_ <- o A..:? "supergroup_id"
        return $ TMeUrlTypeSupergroup {supergroup_id = supergroup_id_}

      parseTMeUrlTypeChatInvite :: A.Value -> T.Parser TMeUrlType
      parseTMeUrlTypeChatInvite = A.withObject "TMeUrlTypeChatInvite" $ \o -> do
        info_ <- o A..:? "info"
        return $ TMeUrlTypeChatInvite {info = info_}

      parseTMeUrlTypeStickerSet :: A.Value -> T.Parser TMeUrlType
      parseTMeUrlTypeStickerSet = A.withObject "TMeUrlTypeStickerSet" $ \o -> do
        sticker_set_id_ <- U.rm <$> (o A..: "sticker_set_id" :: T.Parser String) :: T.Parser (Maybe Int)
        return $ TMeUrlTypeStickerSet {sticker_set_id = sticker_set_id_}
  parseJSON _ = mempty

instance T.ToJSON TMeUrlType where
  toJSON
    TMeUrlTypeUser
      { user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "tMeUrlTypeUser",
          "user_id" A..= user_id_
        ]
  toJSON
    TMeUrlTypeSupergroup
      { supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "tMeUrlTypeSupergroup",
          "supergroup_id" A..= supergroup_id_
        ]
  toJSON
    TMeUrlTypeChatInvite
      { info = info_
      } =
      A.object
        [ "@type" A..= T.String "tMeUrlTypeChatInvite",
          "info" A..= info_
        ]
  toJSON
    TMeUrlTypeStickerSet
      { sticker_set_id = sticker_set_id_
      } =
      A.object
        [ "@type" A..= T.String "tMeUrlTypeStickerSet",
          "sticker_set_id" A..= sticker_set_id_
        ]
