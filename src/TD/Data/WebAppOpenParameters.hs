module TD.Data.WebAppOpenParameters
  ( WebAppOpenParameters(..)    
  , defaultWebAppOpenParameters 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ThemeParameters as ThemeParameters
import qualified Data.Text as T
import qualified TD.Data.WebAppOpenMode as WebAppOpenMode

data WebAppOpenParameters
  = WebAppOpenParameters -- ^ Options to be used when a Web App is opened
    { theme            :: Maybe ThemeParameters.ThemeParameters -- ^ Preferred Web App theme; pass null to use the default theme
    , application_name :: Maybe T.Text                          -- ^ Short name of the current application; 0-64 English letters, digits, and underscores
    , mode             :: Maybe WebAppOpenMode.WebAppOpenMode   -- ^ The mode in which the Web App is opened; pass null to open in webAppOpenModeFullSize
    }
  deriving (Eq, Show)

instance I.ShortShow WebAppOpenParameters where
  shortShow WebAppOpenParameters
    { theme            = theme_
    , application_name = application_name_
    , mode             = mode_
    }
      = "WebAppOpenParameters"
        ++ I.cc
        [ "theme"            `I.p` theme_
        , "application_name" `I.p` application_name_
        , "mode"             `I.p` mode_
        ]

instance AT.FromJSON WebAppOpenParameters where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "webAppOpenParameters" -> parseWebAppOpenParameters v
      _                      -> mempty
    
    where
      parseWebAppOpenParameters :: A.Value -> AT.Parser WebAppOpenParameters
      parseWebAppOpenParameters = A.withObject "WebAppOpenParameters" $ \o -> do
        theme_            <- o A..:?  "theme"
        application_name_ <- o A..:?  "application_name"
        mode_             <- o A..:?  "mode"
        pure $ WebAppOpenParameters
          { theme            = theme_
          , application_name = application_name_
          , mode             = mode_
          }
  parseJSON _ = mempty

instance AT.ToJSON WebAppOpenParameters where
  toJSON WebAppOpenParameters
    { theme            = theme_
    , application_name = application_name_
    , mode             = mode_
    }
      = A.object
        [ "@type"            A..= AT.String "webAppOpenParameters"
        , "theme"            A..= theme_
        , "application_name" A..= application_name_
        , "mode"             A..= mode_
        ]

defaultWebAppOpenParameters :: WebAppOpenParameters
defaultWebAppOpenParameters =
  WebAppOpenParameters
    { theme            = Nothing
    , application_name = Nothing
    , mode             = Nothing
    }

