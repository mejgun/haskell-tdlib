module TD.Query.GetPreparedKeyboardButton
  (GetPreparedKeyboardButton(..)
  , defaultGetPreparedKeyboardButton
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns a keyboard button prepared by the bot for the user. The button will be of the type keyboardButtonTypeRequestUsers, keyboardButtonTypeRequestChat, or keyboardButtonTypeRequestManagedBot. Returns 'TD.Data.KeyboardButton.KeyboardButton'
data GetPreparedKeyboardButton
  = GetPreparedKeyboardButton
    { bot_user_id        :: Maybe Int    -- ^ Identifier of the bot that created the button
    , prepared_button_id :: Maybe T.Text -- ^ Identifier of the prepared button
    }
  deriving (Eq, Show)

instance I.ShortShow GetPreparedKeyboardButton where
  shortShow
    GetPreparedKeyboardButton
      { bot_user_id        = bot_user_id_
      , prepared_button_id = prepared_button_id_
      }
        = "GetPreparedKeyboardButton"
          ++ I.cc
          [ "bot_user_id"        `I.p` bot_user_id_
          , "prepared_button_id" `I.p` prepared_button_id_
          ]

instance AT.ToJSON GetPreparedKeyboardButton where
  toJSON
    GetPreparedKeyboardButton
      { bot_user_id        = bot_user_id_
      , prepared_button_id = prepared_button_id_
      }
        = A.object
          [ "@type"              A..= AT.String "getPreparedKeyboardButton"
          , "bot_user_id"        A..= bot_user_id_
          , "prepared_button_id" A..= prepared_button_id_
          ]

defaultGetPreparedKeyboardButton :: GetPreparedKeyboardButton
defaultGetPreparedKeyboardButton =
  GetPreparedKeyboardButton
    { bot_user_id        = Nothing
    , prepared_button_id = Nothing
    }

