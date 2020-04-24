-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetFileGenerationProgress where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SetFileGenerationProgress = 
 SetFileGenerationProgress { local_prefix_size :: Maybe Int, expected_size :: Maybe Int, generation_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SetFileGenerationProgress where
 toJSON (SetFileGenerationProgress { local_prefix_size = local_prefix_size, expected_size = expected_size, generation_id = generation_id }) =
  A.object [ "@type" A..= T.String "setFileGenerationProgress", "local_prefix_size" A..= local_prefix_size, "expected_size" A..= expected_size, "generation_id" A..= generation_id ]

instance T.FromJSON SetFileGenerationProgress where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setFileGenerationProgress" -> parseSetFileGenerationProgress v
   _ -> mempty
  where
   parseSetFileGenerationProgress :: A.Value -> T.Parser SetFileGenerationProgress
   parseSetFileGenerationProgress = A.withObject "SetFileGenerationProgress" $ \o -> do
    local_prefix_size <- optional $ o A..: "local_prefix_size"
    expected_size <- optional $ o A..: "expected_size"
    generation_id <- optional $ o A..: "generation_id"
    return $ SetFileGenerationProgress { local_prefix_size = local_prefix_size, expected_size = expected_size, generation_id = generation_id }