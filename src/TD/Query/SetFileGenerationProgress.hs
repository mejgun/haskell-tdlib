{-# LANGUAGE OverloadedStrings #-}

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
      { local_prefix_size = local_prefix_size,
        expected_size = expected_size,
        generation_id = generation_id
      } =
      "SetFileGenerationProgress"
        ++ U.cc
          [ U.p "local_prefix_size" local_prefix_size,
            U.p "expected_size" expected_size,
            U.p "generation_id" generation_id
          ]

instance T.ToJSON SetFileGenerationProgress where
  toJSON
    SetFileGenerationProgress
      { local_prefix_size = local_prefix_size,
        expected_size = expected_size,
        generation_id = generation_id
      } =
      A.object
        [ "@type" A..= T.String "setFileGenerationProgress",
          "local_prefix_size" A..= local_prefix_size,
          "expected_size" A..= expected_size,
          "generation_id" A..= generation_id
        ]
