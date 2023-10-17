module TD.Data.ChatFolderIcon
  ( ChatFolderIcon(..)    
  , defaultChatFolderIcon 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data ChatFolderIcon
  = ChatFolderIcon -- ^ Represents an icon for a chat folder
    { name :: Maybe T.Text -- ^ The chosen icon name for short folder representation; one of "All", "Unread", "Unmuted", "Bots", "Channels", "Groups", "Private", "Custom", "Setup", "Cat", "Crown", "Favorite", "Flower", "Game", "Home", "Love", "Mask", "Party", "Sport", "Study", "Trade", "Travel", "Work", "Airplane", "Book", "Light", "Like", "Money", "Note", "Palette"
    }
  deriving (Eq, Show)

instance I.ShortShow ChatFolderIcon where
  shortShow ChatFolderIcon
    { name = name_
    }
      = "ChatFolderIcon"
        ++ I.cc
        [ "name" `I.p` name_
        ]

instance AT.FromJSON ChatFolderIcon where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatFolderIcon" -> parseChatFolderIcon v
      _                -> mempty
    
    where
      parseChatFolderIcon :: A.Value -> AT.Parser ChatFolderIcon
      parseChatFolderIcon = A.withObject "ChatFolderIcon" $ \o -> do
        name_ <- o A..:?  "name"
        pure $ ChatFolderIcon
          { name = name_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatFolderIcon where
  toJSON ChatFolderIcon
    { name = name_
    }
      = A.object
        [ "@type" A..= AT.String "chatFolderIcon"
        , "name"  A..= name_
        ]

defaultChatFolderIcon :: ChatFolderIcon
defaultChatFolderIcon =
  ChatFolderIcon
    { name = Nothing
    }

