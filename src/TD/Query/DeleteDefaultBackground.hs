module TD.Query.DeleteDefaultBackground
  (DeleteDefaultBackground(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes default background for chats. Returns 'TD.Data.Ok.Ok'
data DeleteDefaultBackground
  = DeleteDefaultBackground
    { for_dark_theme :: Maybe Bool -- ^ Pass true if the background is deleted for a dark theme
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteDefaultBackground where
  shortShow
    DeleteDefaultBackground
      { for_dark_theme = for_dark_theme_
      }
        = "DeleteDefaultBackground"
          ++ I.cc
          [ "for_dark_theme" `I.p` for_dark_theme_
          ]

instance AT.ToJSON DeleteDefaultBackground where
  toJSON
    DeleteDefaultBackground
      { for_dark_theme = for_dark_theme_
      }
        = A.object
          [ "@type"          A..= AT.String "deleteDefaultBackground"
          , "for_dark_theme" A..= for_dark_theme_
          ]

