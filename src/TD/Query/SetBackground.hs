module TD.Query.SetBackground
  (SetBackground(..)
  , defaultSetBackground
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputBackground as InputBackground
import qualified TD.Data.BackgroundType as BackgroundType

-- | Changes the background selected by the user; adds background to the list of installed backgrounds
data SetBackground
  = SetBackground
    { background     :: Maybe InputBackground.InputBackground -- ^ The input background to use; pass null to create a new filled background or to remove the current background
    , _type          :: Maybe BackgroundType.BackgroundType   -- ^ Background type; pass null to use the default type of the remote background or to remove the current background
    , for_dark_theme :: Maybe Bool                            -- ^ Pass true if the background is changed for a dark theme
    }
  deriving (Eq, Show)

instance I.ShortShow SetBackground where
  shortShow
    SetBackground
      { background     = background_
      , _type          = _type_
      , for_dark_theme = for_dark_theme_
      }
        = "SetBackground"
          ++ I.cc
          [ "background"     `I.p` background_
          , "_type"          `I.p` _type_
          , "for_dark_theme" `I.p` for_dark_theme_
          ]

instance AT.ToJSON SetBackground where
  toJSON
    SetBackground
      { background     = background_
      , _type          = _type_
      , for_dark_theme = for_dark_theme_
      }
        = A.object
          [ "@type"          A..= AT.String "setBackground"
          , "background"     A..= background_
          , "type"           A..= _type_
          , "for_dark_theme" A..= for_dark_theme_
          ]

defaultSetBackground :: SetBackground
defaultSetBackground =
  SetBackground
    { background     = Nothing
    , _type          = Nothing
    , for_dark_theme = Nothing
    }

