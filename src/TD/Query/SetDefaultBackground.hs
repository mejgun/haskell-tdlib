module TD.Query.SetDefaultBackground
  (SetDefaultBackground(..)
  , defaultSetDefaultBackground
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputBackground as InputBackground
import qualified TD.Data.BackgroundType as BackgroundType

-- | Sets default background for chats; adds the background to the list of installed backgrounds. Returns 'TD.Data.Background.Background'
data SetDefaultBackground
  = SetDefaultBackground
    { background     :: Maybe InputBackground.InputBackground -- ^ The input background to use; pass null to create a new filled background
    , _type          :: Maybe BackgroundType.BackgroundType   -- ^ Background type; pass null to use the default type of the remote background; backgroundTypeChatTheme isn't supported
    , for_dark_theme :: Maybe Bool                            -- ^ Pass true if the background is set for a dark theme
    }
  deriving (Eq, Show)

instance I.ShortShow SetDefaultBackground where
  shortShow
    SetDefaultBackground
      { background     = background_
      , _type          = _type_
      , for_dark_theme = for_dark_theme_
      }
        = "SetDefaultBackground"
          ++ I.cc
          [ "background"     `I.p` background_
          , "_type"          `I.p` _type_
          , "for_dark_theme" `I.p` for_dark_theme_
          ]

instance AT.ToJSON SetDefaultBackground where
  toJSON
    SetDefaultBackground
      { background     = background_
      , _type          = _type_
      , for_dark_theme = for_dark_theme_
      }
        = A.object
          [ "@type"          A..= AT.String "setDefaultBackground"
          , "background"     A..= background_
          , "type"           A..= _type_
          , "for_dark_theme" A..= for_dark_theme_
          ]

defaultSetDefaultBackground :: SetDefaultBackground
defaultSetDefaultBackground =
  SetDefaultBackground
    { background     = Nothing
    , _type          = Nothing
    , for_dark_theme = Nothing
    }

