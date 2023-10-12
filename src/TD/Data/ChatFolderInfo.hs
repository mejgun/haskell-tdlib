module TD.Data.ChatFolderInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatFolderIcon as ChatFolderIcon

data ChatFolderInfo
  = ChatFolderInfo -- ^ Contains basic information about a chat folder
    { _id                 :: Maybe Int                           -- ^ Unique chat folder identifier
    , title               :: Maybe T.Text                        -- ^ The title of the folder; 1-12 characters without line feeds
    , icon                :: Maybe ChatFolderIcon.ChatFolderIcon -- ^ The chosen or default icon for the chat folder
    , is_shareable        :: Maybe Bool                          -- ^ True, if at least one link has been created for the folder
    , has_my_invite_links :: Maybe Bool                          -- ^ True, if the chat folder has invite links created by the current user
    }
  deriving (Eq)

instance Show ChatFolderInfo where
  show ChatFolderInfo
    { _id                 = _id_
    , title               = title_
    , icon                = icon_
    , is_shareable        = is_shareable_
    , has_my_invite_links = has_my_invite_links_
    }
      = "ChatFolderInfo"
        ++ I.cc
        [ "_id"                 `I.p` _id_
        , "title"               `I.p` title_
        , "icon"                `I.p` icon_
        , "is_shareable"        `I.p` is_shareable_
        , "has_my_invite_links" `I.p` has_my_invite_links_
        ]

instance AT.FromJSON ChatFolderInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatFolderInfo" -> parseChatFolderInfo v
      _                -> mempty
    
    where
      parseChatFolderInfo :: A.Value -> AT.Parser ChatFolderInfo
      parseChatFolderInfo = A.withObject "ChatFolderInfo" $ \o -> do
        _id_                 <- o A..:?  "id"
        title_               <- o A..:?  "title"
        icon_                <- o A..:?  "icon"
        is_shareable_        <- o A..:?  "is_shareable"
        has_my_invite_links_ <- o A..:?  "has_my_invite_links"
        pure $ ChatFolderInfo
          { _id                 = _id_
          , title               = title_
          , icon                = icon_
          , is_shareable        = is_shareable_
          , has_my_invite_links = has_my_invite_links_
          }

instance AT.ToJSON ChatFolderInfo where
  toJSON ChatFolderInfo
    { _id                 = _id_
    , title               = title_
    , icon                = icon_
    , is_shareable        = is_shareable_
    , has_my_invite_links = has_my_invite_links_
    }
      = A.object
        [ "@type"               A..= AT.String "chatFolderInfo"
        , "id"                  A..= _id_
        , "title"               A..= title_
        , "icon"                A..= icon_
        , "is_shareable"        A..= is_shareable_
        , "has_my_invite_links" A..= has_my_invite_links_
        ]
