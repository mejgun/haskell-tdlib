module TD.Data.TMeUrlType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatInviteLinkInfo as ChatInviteLinkInfo

data TMeUrlType -- ^ Describes the type of a URL linking to an internal Telegram entity
  = TMeUrlTypeUser -- ^ A URL linking to a user
    { user_id :: Maybe Int -- ^ Identifier of the user
    }
  | TMeUrlTypeSupergroup -- ^ A URL linking to a public supergroup or channel
    { supergroup_id :: Maybe Int -- ^ Identifier of the supergroup or channel
    }
  | TMeUrlTypeChatInvite -- ^ A chat invite link
    { info :: Maybe ChatInviteLinkInfo.ChatInviteLinkInfo -- ^ Information about the chat invite link
    }
  | TMeUrlTypeStickerSet -- ^ A URL linking to a sticker set
    { sticker_set_id :: Maybe Int -- ^ Identifier of the sticker set
    }
  deriving (Eq)

instance Show TMeUrlType where
  show TMeUrlTypeUser
    { user_id = user_id_
    }
      = "TMeUrlTypeUser"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        ]
  show TMeUrlTypeSupergroup
    { supergroup_id = supergroup_id_
    }
      = "TMeUrlTypeSupergroup"
        ++ I.cc
        [ "supergroup_id" `I.p` supergroup_id_
        ]
  show TMeUrlTypeChatInvite
    { info = info_
    }
      = "TMeUrlTypeChatInvite"
        ++ I.cc
        [ "info" `I.p` info_
        ]
  show TMeUrlTypeStickerSet
    { sticker_set_id = sticker_set_id_
    }
      = "TMeUrlTypeStickerSet"
        ++ I.cc
        [ "sticker_set_id" `I.p` sticker_set_id_
        ]

instance AT.FromJSON TMeUrlType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tMeUrlTypeUser"       -> parseTMeUrlTypeUser v
      "tMeUrlTypeSupergroup" -> parseTMeUrlTypeSupergroup v
      "tMeUrlTypeChatInvite" -> parseTMeUrlTypeChatInvite v
      "tMeUrlTypeStickerSet" -> parseTMeUrlTypeStickerSet v
      _                      -> mempty
    
    where
      parseTMeUrlTypeUser :: A.Value -> AT.Parser TMeUrlType
      parseTMeUrlTypeUser = A.withObject "TMeUrlTypeUser" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        pure $ TMeUrlTypeUser
          { user_id = user_id_
          }
      parseTMeUrlTypeSupergroup :: A.Value -> AT.Parser TMeUrlType
      parseTMeUrlTypeSupergroup = A.withObject "TMeUrlTypeSupergroup" $ \o -> do
        supergroup_id_ <- o A..:?  "supergroup_id"
        pure $ TMeUrlTypeSupergroup
          { supergroup_id = supergroup_id_
          }
      parseTMeUrlTypeChatInvite :: A.Value -> AT.Parser TMeUrlType
      parseTMeUrlTypeChatInvite = A.withObject "TMeUrlTypeChatInvite" $ \o -> do
        info_ <- o A..:?  "info"
        pure $ TMeUrlTypeChatInvite
          { info = info_
          }
      parseTMeUrlTypeStickerSet :: A.Value -> AT.Parser TMeUrlType
      parseTMeUrlTypeStickerSet = A.withObject "TMeUrlTypeStickerSet" $ \o -> do
        sticker_set_id_ <- fmap I.readInt64 <$> o A..:?  "sticker_set_id"
        pure $ TMeUrlTypeStickerSet
          { sticker_set_id = sticker_set_id_
          }

instance AT.ToJSON TMeUrlType where
  toJSON TMeUrlTypeUser
    { user_id = user_id_
    }
      = A.object
        [ "@type"   A..= AT.String "tMeUrlTypeUser"
        , "user_id" A..= user_id_
        ]
  toJSON TMeUrlTypeSupergroup
    { supergroup_id = supergroup_id_
    }
      = A.object
        [ "@type"         A..= AT.String "tMeUrlTypeSupergroup"
        , "supergroup_id" A..= supergroup_id_
        ]
  toJSON TMeUrlTypeChatInvite
    { info = info_
    }
      = A.object
        [ "@type" A..= AT.String "tMeUrlTypeChatInvite"
        , "info"  A..= info_
        ]
  toJSON TMeUrlTypeStickerSet
    { sticker_set_id = sticker_set_id_
    }
      = A.object
        [ "@type"          A..= AT.String "tMeUrlTypeStickerSet"
        , "sticker_set_id" A..= I.toS sticker_set_id_
        ]
