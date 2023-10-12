module TD.Query.SetChatBackground where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputBackground as InputBackground
import qualified TD.Data.BackgroundType as BackgroundType

data SetChatBackground -- ^ Changes the background in a specific chat. Supported only in private and secret chats with non-deleted users
  = SetChatBackground
    { chat_id            :: Maybe Int                             -- ^ Chat identifier
    , background         :: Maybe InputBackground.InputBackground -- ^ The input background to use; pass null to create a new filled background or to remove the current background
    , _type              :: Maybe BackgroundType.BackgroundType   -- ^ Background type; pass null to remove the current background
    , dark_theme_dimming :: Maybe Int                             -- ^ Dimming of the background in dark themes, as a percentage; 0-100
    }
  deriving (Eq)

instance Show SetChatBackground where
  show
    SetChatBackground
      { chat_id            = chat_id_
      , background         = background_
      , _type              = _type_
      , dark_theme_dimming = dark_theme_dimming_
      }
        = "SetChatBackground"
          ++ I.cc
          [ "chat_id"            `I.p` chat_id_
          , "background"         `I.p` background_
          , "_type"              `I.p` _type_
          , "dark_theme_dimming" `I.p` dark_theme_dimming_
          ]

instance AT.ToJSON SetChatBackground where
  toJSON
    SetChatBackground
      { chat_id            = chat_id_
      , background         = background_
      , _type              = _type_
      , dark_theme_dimming = dark_theme_dimming_
      }
        = A.object
          [ "@type"              A..= AT.String "setChatBackground"
          , "chat_id"            A..= chat_id_
          , "background"         A..= background_
          , "type"               A..= _type_
          , "dark_theme_dimming" A..= dark_theme_dimming_
          ]
