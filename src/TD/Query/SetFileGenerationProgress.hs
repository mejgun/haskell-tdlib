module TD.Query.SetFileGenerationProgress where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data SetFileGenerationProgress -- ^ Informs TDLib on a file generation progress
  = SetFileGenerationProgress
    { generation_id     :: Maybe Int -- ^ The identifier of the generation process
    , expected_size     :: Maybe Int -- ^ Expected size of the generated file, in bytes; 0 if unknown
    , local_prefix_size :: Maybe Int -- ^ The number of bytes already generated
    }
  deriving (Eq)

instance Show SetFileGenerationProgress where
  show
    SetFileGenerationProgress
      { generation_id     = generation_id_
      , expected_size     = expected_size_
      , local_prefix_size = local_prefix_size_
      }
        = "SetFileGenerationProgress"
          ++ I.cc
          [ "generation_id"     `I.p` generation_id_
          , "expected_size"     `I.p` expected_size_
          , "local_prefix_size" `I.p` local_prefix_size_
          ]

instance AT.ToJSON SetFileGenerationProgress where
  toJSON
    SetFileGenerationProgress
      { generation_id     = generation_id_
      , expected_size     = expected_size_
      , local_prefix_size = local_prefix_size_
      }
        = A.object
          [ "@type"             A..= AT.String "setFileGenerationProgress"
          , "generation_id"     A..= fmap I.writeInt64  generation_id_
          , "expected_size"     A..= expected_size_
          , "local_prefix_size" A..= local_prefix_size_
          ]
