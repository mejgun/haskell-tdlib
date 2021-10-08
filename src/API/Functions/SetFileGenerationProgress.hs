-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetFileGenerationProgress where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Informs TDLib on a file generation progress
-- 
-- __generation_id__ The identifier of the generation process
-- 
-- __expected_size__ Expected size of the generated file, in bytes; 0 if unknown
-- 
-- __local_prefix_size__ The number of bytes already generated
data SetFileGenerationProgress = 

 SetFileGenerationProgress { local_prefix_size :: Maybe Int, expected_size :: Maybe Int, generation_id :: Maybe Int }  deriving (Eq)

instance Show SetFileGenerationProgress where
 show SetFileGenerationProgress { local_prefix_size=local_prefix_size, expected_size=expected_size, generation_id=generation_id } =
  "SetFileGenerationProgress" ++ cc [p "local_prefix_size" local_prefix_size, p "expected_size" expected_size, p "generation_id" generation_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetFileGenerationProgress where
 toJSON SetFileGenerationProgress { local_prefix_size = local_prefix_size, expected_size = expected_size, generation_id = generation_id } =
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
    local_prefix_size <- mconcat [ o A..:? "local_prefix_size", readMaybe <$> (o A..: "local_prefix_size" :: T.Parser String)] :: T.Parser (Maybe Int)
    expected_size <- mconcat [ o A..:? "expected_size", readMaybe <$> (o A..: "expected_size" :: T.Parser String)] :: T.Parser (Maybe Int)
    generation_id <- mconcat [ o A..:? "generation_id", readMaybe <$> (o A..: "generation_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetFileGenerationProgress { local_prefix_size = local_prefix_size, expected_size = expected_size, generation_id = generation_id }
 parseJSON _ = mempty
