module TD.Query.ToggleDownloadIsPaused
  (ToggleDownloadIsPaused(..)
  , defaultToggleDownloadIsPaused
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes pause state of a file in the file download list. Returns 'TD.Data.Ok.Ok'
data ToggleDownloadIsPaused
  = ToggleDownloadIsPaused
    { file_id   :: Maybe Int  -- ^ Identifier of the downloaded file
    , is_paused :: Maybe Bool -- ^ Pass true if the download is paused
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleDownloadIsPaused where
  shortShow
    ToggleDownloadIsPaused
      { file_id   = file_id_
      , is_paused = is_paused_
      }
        = "ToggleDownloadIsPaused"
          ++ I.cc
          [ "file_id"   `I.p` file_id_
          , "is_paused" `I.p` is_paused_
          ]

instance AT.ToJSON ToggleDownloadIsPaused where
  toJSON
    ToggleDownloadIsPaused
      { file_id   = file_id_
      , is_paused = is_paused_
      }
        = A.object
          [ "@type"     A..= AT.String "toggleDownloadIsPaused"
          , "file_id"   A..= file_id_
          , "is_paused" A..= is_paused_
          ]

defaultToggleDownloadIsPaused :: ToggleDownloadIsPaused
defaultToggleDownloadIsPaused =
  ToggleDownloadIsPaused
    { file_id   = Nothing
    , is_paused = Nothing
    }

