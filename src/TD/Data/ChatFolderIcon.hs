{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatFolderIcon where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ChatFolderIcon = -- | Represents an icon for a chat folder @name The chosen icon name for short folder representation; one of "All", "Unread", "Unmuted", "Bots", "Channels", "Groups", "Private", "Custom", "Setup", "Cat", "Crown",
  -- "Favorite", "Flower", "Game", "Home", "Love", "Mask", "Party", "Sport", "Study", "Trade", "Travel", "Work", "Airplane", "Book", "Light", "Like", "Money", "Note", "Palette"
  ChatFolderIcon
  { -- |
    name :: Maybe String
  }
  deriving (Eq)

instance Show ChatFolderIcon where
  show
    ChatFolderIcon
      { name = name_
      } =
      "ChatFolderIcon"
        ++ U.cc
          [ U.p "name" name_
          ]

instance T.FromJSON ChatFolderIcon where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatFolderIcon" -> parseChatFolderIcon v
      _ -> mempty
    where
      parseChatFolderIcon :: A.Value -> T.Parser ChatFolderIcon
      parseChatFolderIcon = A.withObject "ChatFolderIcon" $ \o -> do
        name_ <- o A..:? "name"
        return $ ChatFolderIcon {name = name_}
  parseJSON _ = mempty

instance T.ToJSON ChatFolderIcon where
  toJSON
    ChatFolderIcon
      { name = name_
      } =
      A.object
        [ "@type" A..= T.String "chatFolderIcon",
          "name" A..= name_
        ]
