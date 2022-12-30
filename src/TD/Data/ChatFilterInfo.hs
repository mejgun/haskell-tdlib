{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatFilterInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ChatFilterInfo = -- | Contains basic information about a chat filter
  ChatFilterInfo
  { -- | The chosen or default icon name for short filter representation. One of "All", "Unread", "Unmuted", "Bots", "Channels", "Groups", "Private", "Custom", "Setup", "Cat", "Crown",
    -- "Favorite", "Flower", "Game", "Home", "Love", "Mask", "Party", "Sport", "Study", "Trade", "Travel", "Work", "Airplane", "Book", "Light", "Like", "Money", "Note", "Palette"
    icon_name :: Maybe String,
    -- | The title of the filter; 1-12 characters without line feeds
    title :: Maybe String,
    -- | Unique chat filter identifier
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show ChatFilterInfo where
  show
    ChatFilterInfo
      { icon_name = icon_name_,
        title = title_,
        _id = _id_
      } =
      "ChatFilterInfo"
        ++ U.cc
          [ U.p "icon_name" icon_name_,
            U.p "title" title_,
            U.p "_id" _id_
          ]

instance T.FromJSON ChatFilterInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatFilterInfo" -> parseChatFilterInfo v
      _ -> mempty
    where
      parseChatFilterInfo :: A.Value -> T.Parser ChatFilterInfo
      parseChatFilterInfo = A.withObject "ChatFilterInfo" $ \o -> do
        icon_name_ <- o A..:? "icon_name"
        title_ <- o A..:? "title"
        _id_ <- o A..:? "id"
        return $ ChatFilterInfo {icon_name = icon_name_, title = title_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON ChatFilterInfo where
  toJSON
    ChatFilterInfo
      { icon_name = icon_name_,
        title = title_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "chatFilterInfo",
          "icon_name" A..= icon_name_,
          "title" A..= title_,
          "id" A..= _id_
        ]
