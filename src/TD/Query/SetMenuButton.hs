module TD.Query.SetMenuButton
  (SetMenuButton(..)
  , defaultSetMenuButton
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BotMenuButton as BotMenuButton

-- | Sets menu button for the given user or for all users; for bots only. Returns 'TD.Data.Ok.Ok'
data SetMenuButton
  = SetMenuButton
    { user_id     :: Maybe Int                         -- ^ Identifier of the user or 0 to set menu button for all users
    , menu_button :: Maybe BotMenuButton.BotMenuButton -- ^ New menu button
    }
  deriving (Eq, Show)

instance I.ShortShow SetMenuButton where
  shortShow
    SetMenuButton
      { user_id     = user_id_
      , menu_button = menu_button_
      }
        = "SetMenuButton"
          ++ I.cc
          [ "user_id"     `I.p` user_id_
          , "menu_button" `I.p` menu_button_
          ]

instance AT.ToJSON SetMenuButton where
  toJSON
    SetMenuButton
      { user_id     = user_id_
      , menu_button = menu_button_
      }
        = A.object
          [ "@type"       A..= AT.String "setMenuButton"
          , "user_id"     A..= user_id_
          , "menu_button" A..= menu_button_
          ]

defaultSetMenuButton :: SetMenuButton
defaultSetMenuButton =
  SetMenuButton
    { user_id     = Nothing
    , menu_button = Nothing
    }

