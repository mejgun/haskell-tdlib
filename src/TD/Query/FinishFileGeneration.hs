{-# LANGUAGE OverloadedStrings #-}

module TD.Query.FinishFileGeneration where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.Error as Error
import qualified Utils as U

-- |
-- Finishes the file generation
data FinishFileGeneration = FinishFileGeneration
  { -- | If passed, the file generation has failed and must be terminated; pass null if the file generation succeeded
    _error :: Maybe Error.Error,
    -- | The identifier of the generation process
    generation_id :: Maybe Int
  }
  deriving (Eq)

instance Show FinishFileGeneration where
  show
    FinishFileGeneration
      { _error = _error,
        generation_id = generation_id
      } =
      "FinishFileGeneration"
        ++ U.cc
          [ U.p "_error" _error,
            U.p "generation_id" generation_id
          ]

instance T.ToJSON FinishFileGeneration where
  toJSON
    FinishFileGeneration
      { _error = _error,
        generation_id = generation_id
      } =
      A.object
        [ "@type" A..= T.String "finishFileGeneration",
          "error" A..= _error,
          "generation_id" A..= generation_id
        ]
