{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetFileGenerationProgress where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Informs TDLib on a file generation progress
data SetFileGenerationProgress = SetFileGenerationProgress
  { -- | The number of bytes already generated
    local_prefix_size :: Maybe Int,
    -- | Expected size of the generated file, in bytes; 0 if unknown
    expected_size :: Maybe Int,
    -- | The identifier of the generation process
    generation_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetFileGenerationProgress where
  show
    SetFileGenerationProgress
      { local_prefix_size = local_prefix_size_,
        expected_size = expected_size_,
        generation_id = generation_id_
      } =
      "SetFileGenerationProgress"
        ++ U.cc
          [ U.p "local_prefix_size" local_prefix_size_,
            U.p "expected_size" expected_size_,
            U.p "generation_id" generation_id_
          ]

instance T.ToJSON SetFileGenerationProgress where
  toJSON
    SetFileGenerationProgress
      { local_prefix_size = local_prefix_size_,
        expected_size = expected_size_,
        generation_id = generation_id_
      } =
      A.object
        [ "@type" A..= T.String "setFileGenerationProgress",
          "local_prefix_size" A..= local_prefix_size_,
          "expected_size" A..= expected_size_,
          "generation_id" A..= generation_id_
        ]
