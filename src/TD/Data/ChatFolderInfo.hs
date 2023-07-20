{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatFolderInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatFolderIcon as ChatFolderIcon
import qualified Utils as U

-- |
data ChatFolderInfo = -- | Contains basic information about a chat folder
  ChatFolderInfo
  { -- | True, if the chat folder has invite links created by the current user
    has_my_invite_links :: Maybe Bool,
    -- | True, if at least one link has been created for the folder
    is_shareable :: Maybe Bool,
    -- | The chosen or default icon for the chat folder
    icon :: Maybe ChatFolderIcon.ChatFolderIcon,
    -- | The title of the folder; 1-12 characters without line feeds
    title :: Maybe String,
    -- | Unique chat folder identifier
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show ChatFolderInfo where
  show
    ChatFolderInfo
      { has_my_invite_links = has_my_invite_links_,
        is_shareable = is_shareable_,
        icon = icon_,
        title = title_,
        _id = _id_
      } =
      "ChatFolderInfo"
        ++ U.cc
          [ U.p "has_my_invite_links" has_my_invite_links_,
            U.p "is_shareable" is_shareable_,
            U.p "icon" icon_,
            U.p "title" title_,
            U.p "_id" _id_
          ]

instance T.FromJSON ChatFolderInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatFolderInfo" -> parseChatFolderInfo v
      _ -> mempty
    where
      parseChatFolderInfo :: A.Value -> T.Parser ChatFolderInfo
      parseChatFolderInfo = A.withObject "ChatFolderInfo" $ \o -> do
        has_my_invite_links_ <- o A..:? "has_my_invite_links"
        is_shareable_ <- o A..:? "is_shareable"
        icon_ <- o A..:? "icon"
        title_ <- o A..:? "title"
        _id_ <- o A..:? "id"
        return $ ChatFolderInfo {has_my_invite_links = has_my_invite_links_, is_shareable = is_shareable_, icon = icon_, title = title_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON ChatFolderInfo where
  toJSON
    ChatFolderInfo
      { has_my_invite_links = has_my_invite_links_,
        is_shareable = is_shareable_,
        icon = icon_,
        title = title_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "chatFolderInfo",
          "has_my_invite_links" A..= has_my_invite_links_,
          "is_shareable" A..= is_shareable_,
          "icon" A..= icon_,
          "title" A..= title_,
          "id" A..= _id_
        ]
