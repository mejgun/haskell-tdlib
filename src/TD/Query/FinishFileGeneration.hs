module TD.Query.FinishFileGeneration
  (FinishFileGeneration(..)
  , defaultFinishFileGeneration
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Error as Error

data FinishFileGeneration -- ^ Finishes the file generation
  = FinishFileGeneration
    { generation_id :: Maybe Int         -- ^ The identifier of the generation process
    , _error        :: Maybe Error.Error -- ^ If passed, the file generation has failed and must be terminated; pass null if the file generation succeeded
    }
  deriving (Eq)

instance Show FinishFileGeneration where
  show
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

