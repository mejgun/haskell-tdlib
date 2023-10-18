module TD.Query.FinishFileGeneration
  (FinishFileGeneration(..)
  , defaultFinishFileGeneration
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Error as Error

-- | Finishes the file generation. Returns 'TD.Data.Ok.Ok'
data FinishFileGeneration
  = FinishFileGeneration
    { generation_id :: Maybe Int         -- ^ The identifier of the generation process
    , _error        :: Maybe Error.Error -- ^ If passed, the file generation has failed and must be terminated; pass null if the file generation succeeded
    }
  deriving (Eq, Show)

instance I.ShortShow FinishFileGeneration where
  shortShow
    FinishFileGeneration
      { generation_id = generation_id_
      , _error        = _error_
      }
        = "FinishFileGeneration"
          ++ I.cc
          [ "generation_id" `I.p` generation_id_
          , "_error"        `I.p` _error_
          ]

instance AT.ToJSON FinishFileGeneration where
  toJSON
    FinishFileGeneration
      { generation_id = generation_id_
      , _error        = _error_
      }
        = A.object
          [ "@type"         A..= AT.String "finishFileGeneration"
          , "generation_id" A..= fmap I.writeInt64  generation_id_
          , "error"         A..= _error_
          ]

defaultFinishFileGeneration :: FinishFileGeneration
defaultFinishFileGeneration =
  FinishFileGeneration
    { generation_id = Nothing
    , _error        = Nothing
    }

