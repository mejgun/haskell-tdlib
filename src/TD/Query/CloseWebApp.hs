module TD.Query.CloseWebApp
  (CloseWebApp(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data CloseWebApp -- ^ Informs TDLib that a previously opened Web App was closed
  = CloseWebApp
    { web_app_launch_id :: Maybe Int -- ^ Identifier of Web App launch, received from openWebApp
    }
  deriving (Eq)

instance Show CloseWebApp where
  show
    CloseWebApp
      { web_app_launch_id = web_app_launch_id_
      }
        = "CloseWebApp"
          ++ I.cc
          [ "web_app_launch_id" `I.p` web_app_launch_id_
          ]

instance AT.ToJSON CloseWebApp where
  toJSON
    CloseWebApp
      { web_app_launch_id = web_app_launch_id_
      }
        = A.object
          [ "@type"             A..= AT.String "closeWebApp"
          , "web_app_launch_id" A..= fmap I.writeInt64  web_app_launch_id_
          ]

