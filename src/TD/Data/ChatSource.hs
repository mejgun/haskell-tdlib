module TD.Data.ChatSource
  ( ChatSource(..)                             
  , defaultChatSourcePublicServiceAnnouncement 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes a reason why an external chat is shown in a chat list
data ChatSource
  = ChatSourceMtprotoProxy -- ^ The chat is sponsored by the user's MTProxy server
  | ChatSourcePublicServiceAnnouncement -- ^ The chat contains a public service announcement
    { _type :: Maybe T.Text -- ^ The type of the announcement
    , text  :: Maybe T.Text -- ^ The text of the announcement
    }
  deriving (Eq)

instance Show ChatSource where
  show ChatSourceMtprotoProxy
      = "ChatSourceMtprotoProxy"
  show ChatSourcePublicServiceAnnouncement
    { _type = _type_
    , text  = text_
    }
      = "ChatSourcePublicServiceAnnouncement"
        ++ I.cc
        [ "_type" `I.p` _type_
        , "text"  `I.p` text_
        ]

instance AT.FromJSON ChatSource where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatSourceMtprotoProxy"              -> pure ChatSourceMtprotoProxy
      "chatSourcePublicServiceAnnouncement" -> parseChatSourcePublicServiceAnnouncement v
      _                                     -> mempty
    
    where
      parseChatSourcePublicServiceAnnouncement :: A.Value -> AT.Parser ChatSource
      parseChatSourcePublicServiceAnnouncement = A.withObject "ChatSourcePublicServiceAnnouncement" $ \o -> do
        _type_ <- o A..:?  "type"
        text_  <- o A..:?  "text"
        pure $ ChatSourcePublicServiceAnnouncement
          { _type = _type_
          , text  = text_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatSource where
  toJSON ChatSourceMtprotoProxy
      = A.object
        [ "@type" A..= AT.String "chatSourceMtprotoProxy"
        ]
  toJSON ChatSourcePublicServiceAnnouncement
    { _type = _type_
    , text  = text_
    }
      = A.object
        [ "@type" A..= AT.String "chatSourcePublicServiceAnnouncement"
        , "type"  A..= _type_
        , "text"  A..= text_
        ]

defaultChatSourcePublicServiceAnnouncement :: ChatSource
defaultChatSourcePublicServiceAnnouncement =
  ChatSourcePublicServiceAnnouncement
    { _type = Nothing
    , text  = Nothing
    }

