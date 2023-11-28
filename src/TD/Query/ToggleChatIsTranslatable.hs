module TD.Query.ToggleChatIsTranslatable
  (ToggleChatIsTranslatable(..)
  , defaultToggleChatIsTranslatable
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the translatable state of a chat. Returns 'TD.Data.Ok.Ok'
data ToggleChatIsTranslatable
  = ToggleChatIsTranslatable
    { chat_id         :: Maybe Int  -- ^ Chat identifier
    , is_translatable :: Maybe Bool -- ^ New value of is_translatable
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleChatIsTranslatable where
  shortShow
    ToggleChatIsTranslatable
      { chat_id         = chat_id_
      , is_translatable = is_translatable_
      }
        = "ToggleChatIsTranslatable"
          ++ I.cc
          [ "chat_id"         `I.p` chat_id_
          , "is_translatable" `I.p` is_translatable_
          ]

instance AT.ToJSON ToggleChatIsTranslatable where
  toJSON
    ToggleChatIsTranslatable
      { chat_id         = chat_id_
      , is_translatable = is_translatable_
      }
        = A.object
          [ "@type"           A..= AT.String "toggleChatIsTranslatable"
          , "chat_id"         A..= chat_id_
          , "is_translatable" A..= is_translatable_
          ]

defaultToggleChatIsTranslatable :: ToggleChatIsTranslatable
defaultToggleChatIsTranslatable =
  ToggleChatIsTranslatable
    { chat_id         = Nothing
    , is_translatable = Nothing
    }

