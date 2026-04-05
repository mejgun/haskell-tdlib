module TD.Query.SavePreparedKeyboardButton
  (SavePreparedKeyboardButton(..)
  , defaultSavePreparedKeyboardButton
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.KeyboardButton as KeyboardButton

-- | Saves a keyboard button to be shown to the given user; for bots only. Returns 'TD.Data.Text.Text'
data SavePreparedKeyboardButton
  = SavePreparedKeyboardButton
    { user_id :: Maybe Int                           -- ^ Identifier of the user
    , button  :: Maybe KeyboardButton.KeyboardButton -- ^ The button; must be of the type keyboardButtonTypeRequestUsers, keyboardButtonTypeRequestChat, or keyboardButtonTypeRequestManagedBot
    }
  deriving (Eq, Show)

instance I.ShortShow SavePreparedKeyboardButton where
  shortShow
    SavePreparedKeyboardButton
      { user_id = user_id_
      , button  = button_
      }
        = "SavePreparedKeyboardButton"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          , "button"  `I.p` button_
          ]

instance AT.ToJSON SavePreparedKeyboardButton where
  toJSON
    SavePreparedKeyboardButton
      { user_id = user_id_
      , button  = button_
      }
        = A.object
          [ "@type"   A..= AT.String "savePreparedKeyboardButton"
          , "user_id" A..= user_id_
          , "button"  A..= button_
          ]

defaultSavePreparedKeyboardButton :: SavePreparedKeyboardButton
defaultSavePreparedKeyboardButton =
  SavePreparedKeyboardButton
    { user_id = Nothing
    , button  = Nothing
    }

