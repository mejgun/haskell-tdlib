module TD.Query.ToggleAllDownloadsArePaused
  (ToggleAllDownloadsArePaused(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes pause state of all files in the file download list. Returns 'TD.Data.Ok.Ok'
data ToggleAllDownloadsArePaused
  = ToggleAllDownloadsArePaused
    { are_paused :: Maybe Bool -- ^ Pass true to pause all downloads; pass false to unpause them
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleAllDownloadsArePaused where
  shortShow
    ToggleAllDownloadsArePaused
      { are_paused = are_paused_
      }
        = "ToggleAllDownloadsArePaused"
          ++ I.cc
          [ "are_paused" `I.p` are_paused_
          ]

instance AT.ToJSON ToggleAllDownloadsArePaused where
  toJSON
    ToggleAllDownloadsArePaused
      { are_paused = are_paused_
      }
        = A.object
          [ "@type"      A..= AT.String "toggleAllDownloadsArePaused"
          , "are_paused" A..= are_paused_
          ]

