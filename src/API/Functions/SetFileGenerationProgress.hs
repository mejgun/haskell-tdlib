-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetFileGenerationProgress where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetFileGenerationProgress = 
 SetFileGenerationProgress { local_prefix_size :: Int, expected_size :: Int, generation_id :: Int }  -- deriving (Show)

instance T.ToJSON SetFileGenerationProgress where
 toJSON (SetFileGenerationProgress { local_prefix_size = local_prefix_size, expected_size = expected_size, generation_id = generation_id }) =
  A.object [ "@type" A..= T.String "setFileGenerationProgress", "local_prefix_size" A..= local_prefix_size, "expected_size" A..= expected_size, "generation_id" A..= generation_id ]
-- setFileGenerationProgress SetFileGenerationProgress  { local_prefix_size :: Int, expected_size :: Int, generation_id :: Int } 

